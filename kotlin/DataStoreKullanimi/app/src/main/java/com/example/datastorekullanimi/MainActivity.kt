package com.example.datastorekullanimi

import android.os.Bundle
import android.util.Log
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.example.datastorekullanimi.databinding.ActivityMainBinding
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.coroutineScope
import kotlinx.coroutines.launch

class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding= ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        val ap= AppPref(this)
        CoroutineScope(Dispatchers.Main).launch{
            val liste= HashSet<String>()
            liste.add("sude")
            liste.add("berfin")
            ap.kayitAd("ahmet")
            ap.kayitBoy(1.98)
            ap.kayitBekar(true)
            ap.kayitYas(18)
            ap.kayitArkadasListe(liste)

            val gelenAd=ap.okuAd()
            val gelenYas=ap.okuYas()
            val gelenBoy=ap.okuBoy()
            val gelenBekar=ap.okuBekar()


            Log.e("gelen ad",gelenAd)
            Log.e("gelen yas",gelenYas.toString())
            Log.e("gelen boy",gelenBoy.toString())
            Log.e("gelen bekar",gelenBekar.toString())

            val gelenListe=ap.okuArkadasListe()
            if (gelenListe!=null){
                for (a in gelenListe){
                    Log.e("gelen liste",a)
                }
            }
            var gelenSayac=ap.okuSayac()
            ap.kayitSayac(++gelenSayac)
            binding.textView.text="acilis sayisi= ${gelenSayac}"
        }
    }
}