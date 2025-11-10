package com.example.navigationcompenentkullanimi

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.activity.OnBackPressedCallback
import androidx.navigation.NavArgs
import androidx.navigation.fragment.navArgs
import com.example.navigationcompenentkullanimi.databinding.FragmentDetayBinding
import com.google.android.material.snackbar.Snackbar


class DetayFragment : Fragment() {
    private lateinit var binding: FragmentDetayBinding
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding= FragmentDetayBinding.inflate(inflater, container, false)
        val bundle: DetayFragmentArgs by navArgs()
        val gelenad=bundle.ad
        val gelenyas=bundle.yas
        val urunId=bundle.urun.id
        val urunAd=bundle.urun.ad
        binding.textView2.text="$gelenad $gelenyas $urunId $urunAd"
        val backPress= object : OnBackPressedCallback(true){
            override fun handleOnBackPressed() {
                Snackbar.make(binding.textView2,"geri donme iser misin", Snackbar.LENGTH_SHORT).setAction("evet")
                {
                    isEnabled=false
                    requireActivity().onBackPressedDispatcher.onBackPressed()
                }
                    .show()
            }
        }
        requireActivity().onBackPressedDispatcher.addCallback(viewLifecycleOwner,backPress)
        return binding.root
    }
}