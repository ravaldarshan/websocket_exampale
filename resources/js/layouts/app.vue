<script setup>
import { onMounted } from 'vue'
import { initFlowbite } from 'flowbite'
import Header_components from '@/components/Header.vue'
import Footer from "@/components/Footer.vue";

// initialize components based on data attribute selectors
onMounted(() => {
    initFlowbite();
})
</script>

<template>
    <Header_components/>
        <router-view></router-view>
 	<Footer/> 
</template>