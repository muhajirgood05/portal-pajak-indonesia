<script setup>
import { ref, computed } from 'vue';
import { IonCard, IonCardHeader, IonCardContent, IonBadge, IonButton } from '@ionic/vue';

// --- Data Mockup untuk Artikel ---
// Nantinya, data ini bisa Anda ambil dari API atau file JSON.
const articles = ref([
  {
    id: 1,
    title: 'Panduan Lengkap PPnBM (Barang Mewah)',
    slug: '/materi/ppn-barang-mewah',
    category: 'PPN & PPnBM',
    date: '19 Agustus 2025',
    description: 'Pahami objek, tarif, dan cara penghitungan Pajak Penjualan atas Barang Mewah terbaru.'
  },
  {
    id: 2,
    title: 'Pajak untuk UMKM di Tahun 2025',
    slug: '/materi/pajak-umkm-2025',
    category: 'PPh Final',
    date: '12 Agustus 2025',
    description: 'Perubahan terbaru mengenai PPh Final 0,5% untuk pelaku UMKM dan perhitungannya.'
  },
  {
    id: 3,
    title: 'Cara Lapor SPT Tahunan Pribadi 1770 S',
    slug: '/materi/lapor-spt-1770s',
    category: 'PPh Pribadi',
    date: '5 Agustus 2025',
    description: 'Langkah demi langkah mengisi dan melaporkan SPT Tahunan bagi karyawan dengan penghasilan di atas Rp60 juta.'
  },
  {
    id: 4,
    title: 'Memahami e-Bupot Unifikasi Instansi Pemerintah',
    slug: '/materi/ebupot-unifikasi',
    category: 'PPh Badan',
    date: '29 Juli 2025',
    description: 'Kewajiban dan tata cara pembuatan bukti potong PPh melalui platform e-Bupot Unifikasi.'
  }
]);

// --- Search & Filters ---
const searchQuery = ref('');
const activeCategory = ref(null);

const categories = computed(() => {
  const map = new Map();
  articles.value.forEach(a => map.set(a.category, { title: a.category }));
  return Array.from(map.keys());
});

const filteredArticles = computed(() => {
  const q = searchQuery.value.trim().toLowerCase();
  return articles.value.filter(a => {
    if (activeCategory.value && a.category !== activeCategory.value) return false;
    if (!q) return true;
    return (
      a.title.toLowerCase().includes(q) ||
      a.description.toLowerCase().includes(q)
    );
  });
});

function selectCategory(cat) {
  activeCategory.value = activeCategory.value === cat ? null : cat;
}

function clearFilters() {
  activeCategory.value = null;
  searchQuery.value = '';
}
</script>

<template>
  <div class="min-h-screen bg-gray-50 text-gray-900">
    <div class="max-w-7xl mx-auto px-4 py-12">
      <!-- Hero + Search -->
      <section class="bg-gradient-to-r from-blue-600 to-indigo-600 text-white rounded-2xl p-10 shadow-xl overflow-hidden">
        <div class="md:flex md:items-center md:justify-between gap-8">
          <div class="md:flex-1">
            <h1 class="text-4xl md:text-5xl font-extrabold leading-tight mb-3">Pusat Pengetahuan Pajak</h1>
            <p class="text-blue-100 max-w-2xl mb-6">Panduan, artikel, dan jawaban cepat untuk membantu Anda memahami perpajakan di Indonesia.</p>

            <div class="relative max-w-2xl">
              <input
                v-model="searchQuery"
                type="search"
                placeholder="Cari topik, format, atau peraturan (min 3 huruf)"
                class="w-full rounded-full py-3 px-5 text-gray-800 placeholder-gray-400 shadow-sm"
              />
              <button @click.prevent="searchQuery = searchQuery" class="absolute right-1 top-1/2 -translate-y-1/2 bg-white text-indigo-600 font-medium px-4 py-2 rounded-full shadow">Cari</button>
            </div>
            <div class="mt-4 flex flex-wrap gap-2">
              <button
                v-for="cat in categories"
                :key="cat"
                @click="selectCategory(cat)"
                :class="['px-3 py-1 rounded-full text-sm font-medium transition', activeCategory === cat ? 'bg-white text-indigo-700' : 'bg-indigo-50 text-white/90']"
              >
                {{ cat }}
              </button>
              <button v-if="activeCategory || searchQuery" @click="clearFilters" class="ml-2 text-sm underline">Reset</button>
            </div>
          </div>

          <div class="hidden md:block md:w-1/3">
            <!-- decorative illustration -->
            <svg viewBox="0 0 240 180" class="w-full h-auto opacity-90">
              <defs>
                <linearGradient id="g2" x1="0" x2="1">
                  <stop offset="0%" stop-color="#a78bfa" />
                  <stop offset="100%" stop-color="#60a5fa" />
                </linearGradient>
              </defs>
              <rect x="0" y="0" width="240" height="180" rx="16" fill="url(#g2)" />
            </svg>
          </div>
        </div>
      </section>

      <!-- Content Grid -->
      <section class="mt-10 grid grid-cols-1 lg:grid-cols-3 gap-8">
        <div class="lg:col-span-2">
          <div class="flex items-center justify-between mb-6">
            <h2 class="text-2xl font-bold">Artikel & Panduan</h2>
            <div class="text-sm text-gray-500">Menampilkan {{ filteredArticles.length }} hasil</div>
          </div>

          <div v-if="filteredArticles.length > 0" class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <IonCard v-for="a in filteredArticles" :key="a.id" class="rounded-xl hover:shadow-lg transition-border">
              <IonCardHeader class="p-4">
                <div class="flex justify-between items-start mb-2">
                  <IonBadge color="warning" class="px-2 py-1">{{ a.category }}</IonBadge>
                  <time class="text-xs text-gray-400">{{ a.date }}</time>
                </div>
                <h3 class="text-lg font-semibold mb-2 text-gray-900">{{ a.title }}</h3>
              </IonCardHeader>
              <IonCardContent class="p-4 pt-0">
                <p class="text-sm text-gray-600 mb-4">{{ a.description }}</p>
                <div class="flex items-center gap-3">
                  <router-link :to="a.slug" class="text-indigo-600 font-semibold">Baca</router-link>
                  <IonButton fill="outline" size="small" color="primary" class="ml-auto" :href="a.slug">Detail</IonButton>
                </div>
              </IonCardContent>
            </IonCard>
          </div>

          <div v-else class="bg-white rounded-lg p-8 text-center text-gray-600">Tidak ditemukan artikel yang cocok. Coba kata kunci lain.</div>
        </div>

        <!-- Sidebar: Trending & Tips -->
        <aside class="space-y-6">
          <div class="bg-white rounded-xl p-4 shadow-sm">
            <h4 class="font-semibold mb-3">Trending</h4>
            <ul class="space-y-2 text-sm text-gray-700">
              <li v-for="t in articles.slice(0,3)" :key="t.id">
                <a :href="t.slug" class="hover:underline">{{ t.title }}</a>
              </li>
            </ul>
          </div>

          <div class="bg-white rounded-xl p-4 shadow-sm">
            <h4 class="font-semibold mb-3">Tips Cepat</h4>
            <p class="text-sm text-gray-600">Gunakan kata kunci singkat: misal "PPh 21" atau "e-Faktur". Untuk hasil lebih akurat, tambahkan tahun.</p>
          </div>
        </aside>
      </section>
    </div>
  </div>
</template>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap');
* { font-family: 'Inter', sans-serif; }

/* subtle card border */
.border { border-color: rgba(15,23,42,0.04); }

/* responsive adjustments */
@media (min-width: 1024px) {
  .max-w-7xl { max-width: 1100px; }
}
</style>
