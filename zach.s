.data
str_d:			
.asciz "%d\n"            
array:
.long 5, 10, 3, 6, 4, 12, 6, 11, 1, 0 

.set elem, (.-array)/4    


.globl main
.type main, @function
.text                         
 

main:  

movl $0, %ecx      
movl $0, %ebx 			
movl array, %eax	
jmp array_end 		


operation:  		
movl array(,%ecx,4), %eax    
or $0b00000000000000000000000000010000, %eax  
addl %eax, %ebx		
jge incrementing 	

incrementing:			
inc %ecx			

array_end:  		
cmpl $elem, %ecx	
jl operation 	 

pushl %ebx   
pushl $str_d  
call printf  
addl $8, %esp
ret
