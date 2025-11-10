package com.example.navigationcompenentkullanimi


import android.os.Bundle
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.Navigation
import com.example.navigationcompenentkullanimi.databinding.FragmentAnasayfaBinding
import com.google.android.material.snackbar.Snackbar

class AnasayfaFragment : Fragment() {
    private lateinit var binding: FragmentAnasayfaBinding
 override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding=FragmentAnasayfaBinding.inflate(inflater, container, false)
        binding.buttonDetay.setOnClickListener{
            val urun= Urunler(100,"tv")
            val gecis= AnasayfaFragmentDirections.gecisDetay(urun=urun,"ahmet",23)
            Navigation.findNavController(it).navigate(gecis)
        }
     binding.buttonGoster.setOnClickListener {
         Navigation.findNavController(it).navigate(R.id.bottomSheetGecis)
     }
        return binding.root
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.e("Yasam Dongusu","onCreate")
    }

    override fun onPause() {
        super.onPause()
        Log.e("Yasam dongusu","onPause")
    }

    override fun onResume() {
        super.onResume()
        Log.e("Yasam Dongusu","onResume")
    }
}