package com.example.filmleruygulamasi.ui.fragment

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.databinding.DataBindingUtil
import androidx.fragment.app.viewModels
import androidx.recyclerview.widget.StaggeredGridLayoutManager
import com.example.filmleruygulamasi.R
import com.example.filmleruygulamasi.data.entity.Filmler
import com.example.filmleruygulamasi.databinding.FragmentAnasayfaBinding
import com.example.filmleruygulamasi.ui.adapter.FilmlerAdapter
import com.example.filmleruygulamasi.ui.viewmodel.AnasayfaViewModel
import dagger.hilt.android.AndroidEntryPoint

@AndroidEntryPoint
class AnasayfaFragment : Fragment() {
    private lateinit var binding: FragmentAnasayfaBinding
    private lateinit var viewModel: AnasayfaViewModel
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding= DataBindingUtil.inflate(inflater,R.layout.fragment_anasayfa ,container, false)
        binding.anasayfaToolBarBaslikk="Filmler"

        viewModel.filmlerListesi.observe(viewLifecycleOwner) {
            val filmlerAdapter= FilmlerAdapter(requireContext(),it)
            binding.filmlerAdapter=filmlerAdapter
        }

        return (binding.root)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val tempViewModel: AnasayfaViewModel by viewModels()
    }
}