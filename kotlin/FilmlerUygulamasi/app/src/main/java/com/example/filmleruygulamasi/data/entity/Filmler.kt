package com.example.filmleruygulamasi.data.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey
import org.jetbrains.annotations.NotNull
import java.io.Serializable

@Entity (tableName ="filmler")
data class Filmler (@PrimaryKey(autoGenerate = true) @ColumnInfo(name="id")  var id:Int,
                    @ColumnInfo(name="ad")  var ad: String,
                    @ColumnInfo(name="resim") var resim: String,
                    @ColumnInfo(name="fiyat") var fiyat:Int): Serializable{

}