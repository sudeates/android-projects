package com.example.mvmmkullanimi

class MatematikRepository {
    var mds= MatematikDataSource()
    suspend fun toplamaYap(alinanSayi1: String,alinanSayi2: String): String=mds.toplamaYap(alinanSayi1,alinanSayi2)
    suspend fun carpmaYap(alinanSayi1: String,alinanSayi2: String): String=mds.carpmaYap(alinanSayi1,alinanSayi2)
}