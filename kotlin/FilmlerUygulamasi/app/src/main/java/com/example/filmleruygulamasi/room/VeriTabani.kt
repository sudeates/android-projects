package com.example.filmleruygulamasi.room

import androidx.room.Database
import androidx.room.RoomDatabase
import com.example.filmleruygulamasi.data.entity.Filmler

@Database(entities = [Filmler::class], version = 1)
abstract class VeriTabani : RoomDatabase(){
    abstract fun getFilmlerDao(): FilmlerDao
}