package com.example.filmleruygulamasi.data.repo

import com.example.filmleruygulamasi.data.datasource.FilmlerDatasource
import com.example.filmleruygulamasi.data.entity.Filmler

class FilmlerRepository (var fds: FilmlerDatasource) {
    suspend fun filmleriYukle(): List<Filmler> =fds.filmleriYukle()
}