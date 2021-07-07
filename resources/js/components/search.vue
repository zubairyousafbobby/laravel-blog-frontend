<template>
<div class="menu_srch d-flex" @click="showSearch =!showSearch">
    <i class="fa fa-search search_btn"></i>
    <!-- SEARCH INPUT -->
    <div class="header_serch" v-on:click.stop v-if="showSearch">
        <div class="header_serch_input">
            <input type="text" v-model="str" placeholder="Search">
        </div>
        <div class="header_serch_i"   @click="searchBlog">
            <i class="fa fa-search"></i>
        </div>
    </div>
    <!-- SEARCH INPUT -->
</div>
</template>

<script>
export default {

    data (){
        return {
            showSearch : false,
            str: ''
        }

    },

    methods: {
        searchBlog()
        {
            window.location = `/search?str=${this.str}`
        }

    }
    // created() {
    //     console.log('Component created.')
    // }
}
</script>
