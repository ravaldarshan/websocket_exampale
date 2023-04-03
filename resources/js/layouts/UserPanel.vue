<script setup>
import { onMounted, ref } from "vue";
import { initFlowbite } from "flowbite";
import SideBar from "@/components/userpanel/SideBar.vue";
import Header from "@/components/userpanel/Header.vue";
</script>

<template>
  <Header />
  <SideBar />
  <div class="p-4 sm:ml-64 mt-14">
    <router-view></router-view>
  </div>
</template>

<style scope>
</style>