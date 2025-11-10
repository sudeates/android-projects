package com.example.odev_4

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.navigation.Navigation
import com.example.odev_4.databinding.FragmentAnasayfaBinding


class AnasayfaFragment : Fragment() {
    private lateinit var binding: FragmentAnasayfaBinding
     override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding=FragmentAnasayfaBinding.inflate(inflater,container,false)
        return binding.root
         binding.gitAButton.setOnClickListener {

             Navigation.findNavController(it).navigate(R.id.aGecis)
         }
         binding.gitXButton.setOnClickListener {

             Navigation.findNavController(it).navigate(R.id.xGecis)
         }
    }

}