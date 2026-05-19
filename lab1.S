.syntax unified
.cpu cortex-m4
.thumb

.global lab1

lab1:
    push {lr}

    // Test values
    mov r0, #7      // a
    mov r1, #3      // b
    mov r2, #4      // c

    bl main_funk

    pop {pc}

main_funk:
    push {r4, r5, lr}

    // a * b
    mul r4, r0, r1

    // compare a * b with 10
    cmp r4, #10

    // if a * b >= 10, calculate (a | b) * c
    bge first_case

    // else calculate (a * b) * c
    mul r5, r4, r2
    mov r0, r5
    b end_of_main_funk

first_case:
    // OR operation: a | b
    orr r4, r0, r1

    // multiply result by c
    mul r5, r4, r2

    // save final result in r0
    mov r0, r5

end_of_main_funk:
    pop {r4, r5, pc}
