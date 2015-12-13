	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, lr}

        @ if(term == 0) return prev

    cmp r0, #0
    beq .L3

        @ if(term == 1) return val

    cmp r0, #1
    beq .L4

        @ calculate term-1, val+prev, val

    sub r0, r0, #1
    add r3, r1, r2
    mov r2, r1
    mov r1, r3

	@return fib(term-1, val+prev, val)
   
    bl fibonacci
    
	pop {r3, pc}			@ EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, r2			@ R0 = 0
	pop {r3, pc}			@ EPILOG

.L4:
	mov r0, r1			@ R0 = 1
	pop {r3, pc}			@ EPILOG

	.size fibonacci, .-fibonacci
	.end
