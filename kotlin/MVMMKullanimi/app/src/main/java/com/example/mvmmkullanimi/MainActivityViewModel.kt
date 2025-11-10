package com.example.mvmmkullanimi

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class MainActivityViewModel : ViewModel() {
    var sonuc= MutableLiveData("0")
    var mrepo= MatematikRepository()
    fun toplamaYap(alinanSayi1: String,alinanSayi2: String){
        CoroutineScope(Dispatchers.Main).launch{
            sonuc.value=mrepo.toplamaYap(alinanSayi1,alinanSayi2)
        }
    }
    fun carpmaYap(alinanSayi1: String,alinanSayi2: String){
        CoroutineScope(Dispatchers.Main).launch{
            sonuc.value=mrepo.carpmaYap(alinanSayi1,alinanSayi2)
        }
    }
}
