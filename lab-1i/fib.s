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
	push {r3, r4, r5, r6, lr}
    
    mov r3, #-1         @r3 = previous = -1
    mov r4, #1          @r4 = result = 1
    mov r5, #0          @r5 = sum = 0
    mov r6, r0          @r6 = r0
    
loop:
    
    add r5, r4, r3      @sum = result + previous
    mov r3, r4          @previous = result 
    mov r4, r5          @result = sum
    sub r6, #1         @input -1
    cmp r6, #-1
    bne loop           @if (r6 <0) go to loop again
    
    mov r0, r4          @return result
    
	pop {r3, r4, r5, r6, pc}		@EPILOG

	@ END CODE MODIFICATION


	.size fibonacci, .-fibonacci
	.end
