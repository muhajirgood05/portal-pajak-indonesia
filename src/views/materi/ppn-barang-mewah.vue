<template>
  <div class="min-h-screen bg-gray-50 text-gray-800 py-12">
    <div class="container mx-auto max-w-4xl px-4">
      <nav class="text-sm mb-4 text-gray-600">
        <router-link to="/" class="text-blue-600 hover:underline">Beranda</router-link>
        <span class="mx-2">/</span>
        <router-link to="/materi" class="text-blue-600 hover:underline">Materi</router-link>
        <span class="mx-2">/</span>
        <span class="text-gray-700">PPnBM (Barang Mewah)</span>
      </nav>

      <article class="bg-white rounded-xl shadow p-6">
        <header class="mb-4">
          <h1 class="text-2xl font-bold text-blue-900">Panduan Lengkap PPnBM (Barang Mewah)</h1>
          <div class="mt-2 text-sm text-gray-500">19 Agustus 2025 • Kategori: PPN &amp; PPnBM</div>
        </header>

        <section class="prose max-w-none text-gray-700">
          <h2>Apa itu PPnBM?</h2>
          <p>PPnBM adalah Pajak Penjualan atas Barang Mewah yang dikenakan pada barang tertentu yang dianggap mewah oleh peraturan fiskal. Tujuannya adalah mengenakan tarif tambahan pada barang yang konsumsi atau penggunaannya dinilai tidak prioritas.</p>

          <h3>Objek dan Tarif</h3>
          <p>Objek PPnBM mencakup barang-barang seperti mobil mewah, perhiasan tertentu, kapal pesiar, dan barang lain yang secara eksplisit tercantum pada peraturan. Tarif bervariasi berdasarkan jenis barang—bisa persentase tetap atau bertingkat.</p>

          <h3>Contoh Perhitungan (Sederhana)</h3>
          <p>Jika harga barang kena pajak adalah Rp100.000.000 dan tarif PPnBM 10% maka PPnBM = 10% × Rp100.000.000 = Rp10.000.000.</p>

          <h3>Pengecualian dan Ketentuan Khusus</h3>
          <p>Ada aturan khusus untuk impor barang, perhitungan DPP, serta fasilitas untuk industri tertentu. Selalu cek peraturan terbaru atau konsultasi dengan konsultan pajak untuk kasus rumit.</p>

          <div class="mt-6 p-4 bg-yellow-50 border border-yellow-200 rounded text-yellow-800">
            <strong>Catatan:</strong> Halaman ini ringkasan umum. Untuk perhitungan lengkap dan peraturan terbaru, rujuk ke peraturan Dirjen Pajak atau konsultasi resmi.
          </div>
        </section>
      </article>
    </div>
  </div>
</template>

<script setup>
// simple static page; data can be fetched later if needed
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
* { font-family: 'Inter', sans-serif; }

.prose h2 { color: #1e3a8a; } /* blue-900 */
.prose h3 { color: #1e40af; }
</style>
