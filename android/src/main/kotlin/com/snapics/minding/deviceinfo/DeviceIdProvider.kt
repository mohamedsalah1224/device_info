package com.snapics.minding.deviceinfo

import android.annotation.SuppressLint
import android.content.Context
import android.media.MediaDrm
import android.provider.Settings
import com.snapics.minding.deviceinfo.checksum.CRC64
import java.util.UUID
import java.util.zip.Checksum

class DeviceIdProvider(private val context: Context) {

    private companion object {

        private val UUIDS = arrayOf(
            UUID(0x1077EFECC0B24D02L, -0x531cc3e1ad1d04b5L),
            UUID(-0x1d8e62a7567a4c37L, 0x781AB030AF78D30EL),
            UUID(-0x121074568629b532L, -0x5c37d8232ae2de13L),
            UUID(-0x65fb0f8667bfbd7aL, -0x546d19a41f77a06bL),
        )
    }

    @SuppressLint("HardwareIds")
    fun getDeviceId(): String? {
        for (uuid in UUIDS) {
            val id = getId(uuid)
            if (id != null) {
                val checksum: Checksum = CRC64()
                checksum.update(id, 0, id.size)
                return java.lang.Long.toHexString(checksum.value)
            }
        }
        return try {
            Settings.Secure.getString(context.contentResolver, Settings.Secure.ANDROID_ID)
        } catch (e: Exception) {
            null
        }
    }

    private fun getId(uuid: UUID): ByteArray? {
        return try {
            MediaDrm(uuid).getPropertyByteArray(MediaDrm.PROPERTY_DEVICE_UNIQUE_ID)
        } catch (e: Exception) {
            null
        }
    }
}
