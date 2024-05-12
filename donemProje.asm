RANDGEN:            ; sistem zamanini kullanarak random olusturma
RANDSTART:
                    ; b veya B'ye basildigini kontrol et
    mov ah, 08h     ; Klavyeden bir karakter almak icin DOS hizmet cagrisi yapilacagini belirtir.
    int 21h         ; DOS hizmet çcagrisi
    cmp al, 'b'     ; 'b' tusuna basildi mi kontrol et
    jne RANDSTART   ; Eger 'b' tusuna basilmadiysa, tekrar baslat

    MOV AH, 00h     ; sistem zamanini alma        
    INT 1AH         ; gece yarisindan simdiye kadar olan zamani CX:DX e ata      

    mov  ax, dx     ; dx deðerini ax e atama
    xor  dx, dx     ; xor register temizleme
    mov  cx, 10     ; 10 a bolme islemi
    div  cx         ; burada dx bolumun geri kalanini icerir - 0'dan 9'a kadar

    add dl, '0'     ; ascii koda donusturme
    mov ah, 02h     ; DL'de bir deger goruntulemek icin cagri kesme
    int 21h         ; ekranda goster
       
RET
