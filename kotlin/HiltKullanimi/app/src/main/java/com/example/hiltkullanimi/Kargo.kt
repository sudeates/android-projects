package com.example.hiltkullanimi

import android.util.Log
import javax.inject.Inject

class Kargo @Inject constructor(var adres: Adres) {
    fun gonder(){
        Log.e("sonuc","kargo ${adres.adresBilgisi} adresine gonderildi")
    }
}