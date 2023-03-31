<script setup>
import { onMounted, ref } from 'vue'
import { initFlowbite } from 'flowbite'
import Header_components from '@/components/Header.vue'
import Footer from "@/components/Footer.vue";
const scrollTop = ref(0);
// initialize components based on data attribute selectors
onMounted(() => {
    initFlowbite();
    window.addEventListener('scroll', () => {
        scrollTop.value = window.pageYOffset || document.documentElement.scrollTop;
    });
})

const scrollToTop = () => {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
};


</script>

<template>
    <Header_components/>
        <h1>layout 2</h1>
        <router-view></router-view>
 	<Footer/> 
     <button type="button"  v-if="scrollTop > 0" @click="scrollToTop"
    class="text-white fixed animate-bounce bottom-5 right-5 bg-blue-700 hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Scroll to top</button>

</template>

<style scope>

</style>