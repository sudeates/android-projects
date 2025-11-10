package com.example.kotlindersleri.nesne_tabanli_programlama

fun main(){
    val f=odev2_fonksiyonlar()
    println( f.translateToFahreineit(30))
    var faktoriyel= f.calculateFactorial(5)
    println(faktoriyel)
    var aHarfi=f.aHarfiniSay("ankara")
    println(aHarfi)
    var maas=f.maasHesapla(30)
    println( maas)
    var icAci0Toplami=f.icAcilariHesapla(5)
    println(icAci0Toplami)
    var ucret=f.kotaUcretiHesapla(60)
    println(ucret)
    f.cevreyiBul(30,40)

}