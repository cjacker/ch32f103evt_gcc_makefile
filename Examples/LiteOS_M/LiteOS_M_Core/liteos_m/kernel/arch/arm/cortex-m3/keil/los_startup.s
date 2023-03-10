;
; Copyright (c) 2013-2019 Huawei Technologies Co., Ltd. All rights reserved.
; Copyright (c) 2020-2021 Huawei Device Co., Ltd. All rights reserved.
;
; Redistribution and use in source and binary forms, with or without modification,
; are permitted provided that the following conditions are met:
;
; 1. Redistributions of source code must retain the above copyright notice, this list of
;    conditions and the following disclaimer.
;
; 2. Redistributions in binary form must reproduce the above copyright notice, this list
;    of conditions and the following disclaimer in the documentation and/or other materials
;    provided with the distribution.
;
; 3. Neither the name of the copyright holder nor the names of its contributors may be used
;    to endorse or promote products derived from this software without specific prior written
;    permission.
;
; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
; "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
; THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
; PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
; CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
; EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
; PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
; WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
; OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
; ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;
;*----------------------------------------------------------------------------
;*      Name:    LOS_VENDOR.S
;*      Purpose: Thread scheduler
;*      Rev.:    V1.0.0
;*----------------------------------------------------------------------------


        PRESERVE8

    AREA    RESET, CODE, READONLY
    THUMB

    IMPORT  ||Image$$ARM_LIB_STACKHEAP$$ZI$$Limit||
    IMPORT  HalHwiDefaultHandler

    EXPORT  _BootVectors
    EXPORT  Reset_Handler

_BootVectors
    DCD     ||Image$$ARM_LIB_STACKHEAP$$ZI$$Limit||
    DCD     Reset_Handler
    DCD     HalHwiDefaultHandler
    DCD     HalHwiDefaultHandler


Reset_Handler
    CPSID   I

;    IMPORT  LOS_HardBootInit
;    BL      LOS_HardBootInit
 
	IMPORT  SystemInit
	IMPORT  __main

      LDR      r1, =0x1ffff000
      MOV      r0, #0x300
      STRH     r0, [r1,#0x1b0]
      LDR      r0, =0x40022000
loop
      LDR      r1, [r0,#0xc]
      TST      r1, #1
      BNE      loop		

    LDR     R0, SystemInit
    BX      R0
	
    LDR     R0, =__main
    BX      R0

    ALIGN
    END
