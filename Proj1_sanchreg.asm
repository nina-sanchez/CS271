TITLE Proj1_sanchreg     (Proj1_sanchreg.asm)

; Author: Regina Sanchez
; Last Modified: 10/24/2023
; OSU email address: sanchreg@oregonstate.edu
; Course number/section:   CS271 Section 400
; Project Number:  1       Due Date: 10/22/2023 - using two grace days
; Description: This file performs basic arithmetic from 3 user inputs. It displays a hello 
; and goodbye message, shows the arithmetic on the user inputs, and then exits


INCLUDE Irvine32.inc


.data


introMessage		BYTE	"Elementary Arithmetic       by Regina Sanchez", 0				; first message to appear to user				
displayRules		BYTE	"Enter 3 Numbers A > B > C, and I'll show you the sums and differences", 0	; rules for user to follow
userFirst		BYTE	"First Number: ", 0								; displayed to get first user input
userSecond		BYTE	"Second Number: ", 0								; displayed to get second user input
userThird		BYTE	"Third Number: ", 0								; displayed to get third user input
firstNumber		DWORD ?											; will be entered by user, a
secondNumber		DWORD ?											; will be entered by user, b
thirdNumber		DWORD ?											; will be entered by user, c
aPlusB			DWORD ?											; calculation for a + b
aMinusB			DWORD ?											; calculation for a - b
aPlusC			DWORD ?											; calculation for a + c
aMinusC			DWORD ?											; calculation for a - c
bPlusC			DWORD ?											; calculation for b + c
bMinusC			DWORD ?											; calculation for b - c
totalSum		DWORD ?											; caculation for a + b + c
additionSign		BYTE	" + ", 0									; print to user the + symbol
subtractionSign		BYTE	" - ", 0									; print to user the - symbol
equalSign		BYTE	" = ", 0									; print to user the = symbol
outroMessage		BYTE	"Thanks for using Elementary Arithmetic! Goodbye!",0				; message displayed to user at the end


.code
main PROC

; -------------------------------------------------------------
; Introduction to user, outputs hello message
; -------------------------------------------------------------
	mov	edx,		OFFSET introMessage
	call	WriteString
	call	CrLf


; -------------------------------------------------------------
; Get user's data, the three numbers they would like to use
; -------------------------------------------------------------
	mov	edx,		OFFSET	displayRules
	call	WriteString
	call	CrLf
	mov	edx,		OFFSET	userFirst
	call	WriteString
	call	ReadDec
	mov	firstNumber,	EAX
	mov	edx,		OFFSET	userSecond
	call	WriteString
	call	ReadDec
	mov	secondNumber,	EAX
	mov	edx,		OFFSET userThird
	call	WriteString
	call	ReadDec
	mov	thirdNumber,	EAX


; -------------------------------------------------------------
; Calculate arithmetic, uses three numbers from user inputs
; -------------------------------------------------------------
	; gets a + b
	mov		eax,		firstNumber
	mov		ebx,		secondNumber
	add		eax,		ebx
	mov		aPlusB,		eax

	; gets a - b
	mov		eax,		firstNumber
	mov		ebx,		secondNumber
	sub		eax,		ebx
	mov		aMinusB,	eax

	; gets a + c
	mov		eax,		firstNumber
	mov		ebx,		thirdNumber
	add		eax,		ebx
	mov		aPlusC,		eax

	; gets a - c
	mov		eax,		firstNumber
	mov		ebx,		thirdNumber
	sub		eax,		ebx
	mov		aMinusC,	eax

	; gets b + c
	mov		eax,		secondNumber
	mov		ebx,		thirdNumber
	add		eax,		ebx
	mov		bPlusC,		eax

	; gets b - c
	mov		eax,		secondNumber
	mov		ebx,		thirdNumber
	sub		eax,		ebx
	mov		bMinusC,	eax

	; adds a + b + c
	mov		eax,		firstNumber
	mov		ebx,		secondNumber
	add		eax,		ebx
	mov		ebx,		thirdNumber
	add		eax,		ebx
	mov		totalSum,	eax


; -------------------------------------------------------------
; Display Results, prints the a + b = c format, varying
; -------------------------------------------------------------
	; displays a + b
	mov	eax,		firstNumber 		; don't need to use offset
	call	WriteDec
	mov	edx,		OFFSET	additionSign
	call	WriteString
	mov	eax,		secondNumber
	call	WriteDec
	mov	edx,		OFFSET	equalSign
	call	WriteString
	mov	eax,		aPlusB
	call	WriteDec
	call	CrLf

	; displays a - b
	mov	eax,		firstNumber
	call	WriteDec
	mov	edx,		OFFSET	subtractionSign
	call	WriteString
	mov	eax,		secondNumber
	call	WriteDec
	mov	edx,		OFFSET	equalSign
	call	WriteString
	mov	eax,		aMinusB
	call	WriteDec
	call	CrLf

	; displays a + c
	mov	eax,		firstNumber
	call	WriteDec
	mov	edx,		OFFSET	additionSign
	call	WriteString
	mov	eax,		thirdNumber
	call	WriteDec
	mov	edx,		OFFSET	equalSign
	call	WriteString
	mov	eax,		aPlusC
	call	WriteDec
	call	CrLf

	; displays a - c
	mov	eax,		firstNumber
	call	WriteDec
	mov	edx,		OFFSET	subtractionSign
	call	WriteString
	mov	eax,		thirdNumber
	call	WriteDec
	mov	edx,		OFFSET equalSign
	call	WriteString
	mov	eax,		aMinusC
	call	WriteDec
	call	CrLf

	; displays b + c
	mov	eax,		secondNumber
	call	WriteDec
	mov	edx,		OFFSET	additionSign
	call	WriteString
	mov	eax,		thirdNumber
	call	WriteDec
	mov	edx,		OFFSET equalSign
	call	WriteString
	mov	eax,		bPlusC
	call	WriteDec
	call	CrLf

	; display b - c
	mov	eax,		secondNumber
	call	WriteDec
	mov	edx,		OFFSET subtractionSign
	call	WriteString
	mov	eax,		thirdNumber
	call	WriteDec
	mov	edx,		OFFSET equalSign
	call	WriteString
	mov	eax,		bMinusC
	call	WriteDec
	call	CrLf

	; displays a + b + c
	mov	eax,		firstNumber
	call	WriteDec
	mov	edx,		OFFSET	additionSign
	call	WriteString
	mov	eax,		secondNumber
	call	WriteDec
	mov	edx,		OFFSET	additionSign
	call	WriteString
	mov	eax,		thirdNumber
	call	WriteDec
	mov	edx,		OFFSET equalSign
	call	WriteString
	mov	eax,		totalSum
	call	WriteDec
	call	CrLf


; -------------------------------------------------------------
; Say's Goodbye to user
; -------------------------------------------------------------
	mov	edx,		OFFSET outroMessage
	call	WriteString
	call	CrLf

	Invoke ExitProcess,0	; exit to operating system
main ENDP


END main
