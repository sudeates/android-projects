package com.example.filmleruygulamasi.room

import androidx.room.Dao
import androidx.room.Query
import com.example.filmleruygulamasi.data.entity.Filmler

@Dao
interface FilmlerDao {
    @Query ("SELECT * FROM filmler")
    suspend fun filmleriYukle() : List<Filmler>
}