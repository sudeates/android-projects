package com.example.filmleruygulamasi.data.datasource

import com.example.filmleruygulamasi.data.entity.Filmler
import com.example.filmleruygulamasi.room.FilmlerDao
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class FilmlerDatasource (var fdao: FilmlerDao) {
    suspend fun filmleriYukle(): List<Filmler> =
        withContext(Dispatchers.IO) {
            return@withContext fdao.filmleriYukle()
        }
}