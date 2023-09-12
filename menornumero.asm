.data
    numero1: .word 0
    numero2: .word 0
    numero3: .word 0
    mensaje: .asciiz "COMPARADOR-: Ingresa el primer número: "
    mensaje2: .asciiz "COMPARADOR-: Ingresa el segundo número: "
    mensaje3: .asciiz "COMPARADOR-: Ingresa el tercer número: "
    mensaje_menor: .asciiz "El número menor es: "

.text
.globl main

main:
    # Ingresar el primer número
    li $v0, 4
    la $a0, mensaje
    syscall

    li $v0, 5
    syscall
    sw $v0, numero1

    # Ingresar el segundo número
    li $v0, 4
    la $a0, mensaje2
    syscall

    li $v0, 5
    syscall
    sw $v0, numero2
    
    # Ingresar el tercer número
    li $v0, 4
    la $a0, mensaje3
    syscall

    li $v0, 5
    syscall
    sw $v0, numero3

    # Encontrar el número menor
    lw $t0, numero1
    lw $t1, numero2
    lw $t2, numero3

    # Compara $t0 y $t1 para encontrar el menor
    ble $t0, $t1, menor_1_2
    move $t0, $t1

menor_1_2:
    # Compara $t0 (menor de 1 y 2) con $t2 (tercer número)
    ble $t0, $t2, print_result
    move $t0, $t2

print_result:
    # Mostrar el número menor
    li $v0, 4
    la $a0, mensaje_menor
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    # Salir del programa
    li $v0, 10
    syscall

