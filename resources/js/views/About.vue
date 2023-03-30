
<script setup>

import imageUrl from '@/assets/images/image1.png'
import imageUrl2 from '@/assets/images/image2.png'
import aboutus from '@/assets/images/aboutus/banner.jpg'

const items= [
    {
      path: imageUrl,
      text: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
    },
    {
      path: imageUrl2,
      text: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
    },
];
</script>
<template>
    <section class="bg-white dark:bg-gray-900">
        <div class="text-center py-5 h-[600px] mb-5 content-center grid  gap-4 " :style="{ backgroundImage: `url(${aboutus})`}">
            <!-- <div class="content-center grid  gap-4 "> -->

            <h1
                class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-white md:text-5xl 
                lg:text-6xl ">
                ABOUT US
            </h1>
            <p class="mb-6 text-lg font-normal text-black lg:text-xl sm:px-16 xl:px-48 dark:text-white-400">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus
                at sollicitudin nibh, non consequat enim. Integer laoreet, quam ac
                interdum auctor, lorem ipsum dignissim nisl, eu molestie justo
                velit vel nulla. Donec in venenatis ipsum. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus
                at sollicitudin nibh, non consequat enim. Integer laoreet, quam ac
                interdum auctor, lorem ipsum dignissim nisl, eu molestie justo
                velit vel nulla. Donec in venenatis ipsum.
            </p>  
         <!-- </div> -->

        </div>

        <h3
                class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white text-center">
                FOUNDERS
            </h3>
        <div class="container mx-auto py-5">
            <div role="status" class="space-y-8 md:space-y-0 md:space-x-8 md:flex md:items-center">
                <div class="flex items-center justify-center w-full h-48 bg-gray-300 rounded sm:w-96 dark:bg-gray-700">
                    <img :src="items[0].path" alt="">
                </div>
                <div class="w-full">
                    <div class="mb-4">
                        {{ items[0].text }}
                    </div>
                </div>
            </div>
        </div>
        <div class="container mx-auto py-5">
            <div role="status" class="space-y-8 md:space-y-0 md:space-x-8 md:flex md:items-center">
                <div class="w-full">
                    <div class="mb-4">
                        {{ items[1].text }}
                    </div>
                </div>
                <div class="flex items-center justify-center w-full h-48 bg-gray-300 rounded sm:w-96 dark:bg-gray-700">
                    <img :src="items[1].path" alt="">
                </div>
            </div>
        </div>
    </section>
</template>
