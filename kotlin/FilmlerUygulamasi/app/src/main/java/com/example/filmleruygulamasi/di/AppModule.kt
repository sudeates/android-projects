package com.example.filmleruygulamasi.di

import android.content.Context
import androidx.room.Room
import com.example.filmleruygulamasi.data.datasource.FilmlerDatasource
import com.example.filmleruygulamasi.data.repo.FilmlerRepository
import com.example.filmleruygulamasi.room.FilmlerDao
import com.example.filmleruygulamasi.room.VeriTabani
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.qualifiers.ApplicationContext
import dagger.hilt.components.SingletonComponent
import javax.inject.Singleton


@Module
@InstallIn(SingletonComponent::class)
class AppModule {
    @Provides
    @Singleton
    fun provideFilmlerDataSource(fdao: FilmlerDao) : FilmlerDatasource{
        return FilmlerDatasource(fdao)
    }
    @Provides
    @Singleton
    fun provideFilmlerRepository(fds: FilmlerDatasource) : FilmlerRepository{
        return FilmlerRepository(fds)
    }
    @Provides
    @Singleton
    fun provideFilmlerDao(@ApplicationContext context: Context) : FilmlerDao{
        val vt= Room.databaseBuilder(context, VeriTabani::class.java,"filmler_app.sqlite")
            .createFromAsset("filmler_app.sqlite").build()
        return vt.getFilmlerDao()
    }
}