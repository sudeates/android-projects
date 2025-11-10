package com.example.kisileruygulamasi.data.datasource

import android.util.Log
import com.example.kisileruygulamasi.data.entity.Kisiler
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext


class KisilerDataSource {

    suspend fun kisileriYukle(): List<Kisiler> =
        withContext(Dispatchers.IO) {
            val kisilerListesi = ArrayList<Kisiler>()
            val k1 = Kisiler(kisi_id = 1, kisi_ad = "Ahmet", kisi_tel = "1111")
            val k2 = Kisiler(kisi_id = 2, kisi_ad = "Zeynep", kisi_tel = "2222")
            val k3 = Kisiler(kisi_id = 3, kisi_ad = "Beyza", kisi_tel = "3333")

            kisilerListesi.add(k1)
            kisilerListesi.add(k2)
            kisilerListesi.add(k3)

            return@withContext kisilerListesi
        }

    suspend fun ara(aramaKelimesi: String): List<Kisiler> =
        withContext(Dispatchers.IO) {
            val kisilerListesi = ArrayList<Kisiler>()
            val k1 = Kisiler(kisi_id = 1, kisi_ad = "Ahmet", kisi_tel = "1111")

            kisilerListesi.add(k1)

            return@withContext kisilerListesi
        }

    suspend fun kaydet(kisi_ad: String, kisi_tel: String) {
        Log.e("Kişi Kaydet", "$kisi_ad - $kisi_tel")
    }

    suspend fun guncelle(kisi_id: Int, kisi_ad: String, kisi_tel: String) {
        Log.e("Kişi Güncelle", "$kisi_id - $kisi_ad - $kisi_tel")
    }
    suspend fun sil(kisi_id: Int) {
        Log.e("Kişi Güncelle", "$kisi_id")
    }
}
