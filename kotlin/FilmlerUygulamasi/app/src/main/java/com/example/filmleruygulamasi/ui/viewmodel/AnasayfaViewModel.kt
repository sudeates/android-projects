package com.example.filmleruygulamasi.ui.viewmodel

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.filmleruygulamasi.data.entity.Filmler
import com.example.filmleruygulamasi.data.repo.FilmlerRepository
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import dagger.hilt.android.lifecycle.HiltViewModel
import javax.inject.Inject

@HiltViewModel
class AnasayfaViewModel @Inject constructor (var frepo: FilmlerRepository) : ViewModel(){
    var filmlerListesi= MutableLiveData<List<Filmler>>()
    init {
        filmleriYukle()
    }
    fun filmleriYukle(){
        CoroutineScope(Dispatchers.Main).launch {
            filmlerListesi.value=frepo.filmleriYukle()
        }
    }
}