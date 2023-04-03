
<script setup>
	import {onMounted,ref, computed} from "vue";
	import { useHead } from '@unhead/vue'
	import HomeCarousel from "@/components/carousel/HomeCarousel.vue";
	import HeroSection from "@/components/HeroSection.vue";
	import CardSection from "@/components/CardSection.vue";
	import CtaSection from "@/components/Cta.vue";
	import TeamsSection from "@/components/Teams.vue";

	const title = ref('Home')
	const metaobj =  [
            {
                name: 'description',
                content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at sollicitudin nibh, non consequat enim. Integer laoreet, quam ac interdum auctor, lorem ipsum dignissim nisl, eu molestie justo velit vel nulla. Donec in venenatis ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus at sollicitudin nibh, non consequat enim. Integer laoreet, quam ac interdum auctor, lorem ipsum dignissim nisl, eu molestie justo velit vel nulla. Donec in venenatis ipsum.' 
            }, 
            {
                name: 'robots',
                content: 'Lorem ipsum dolor sit amet,' 
            }, 
            {
                name: 'googlebot',
                content: 'Lorem ipsum dolor sit amet,' 
            }, 
        ]

    useHead({
      title,
      meta: metaobj
    })
</script>

<template>
	<HeroSection/>
	<HomeCarousel/>
	<CardSection/>
	<TeamsSection/>
	<CtaSection/>
</template>
