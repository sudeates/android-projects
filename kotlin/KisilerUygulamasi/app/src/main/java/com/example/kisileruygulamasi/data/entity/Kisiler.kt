package com.example.kisileruygulamasi.data.entity


import org.jetbrains.annotations.NotNull
import java.io.Serializable


data class Kisiler(var kisi_id: Int,
                  var kisi_ad: String,
                  var kisi_tel: String): Serializable{}