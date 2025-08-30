<script setup lang="ts">
import { RouterView } from 'vue-router'
</script>

<template>
  <div class="bg-gray-50 text-gray-800 font-sans">
    <div class="container mx-auto p-4 sm:p-6 md:p-8 max-w-5xl">
      <RouterView />
    </div>
  </div>
</template>
