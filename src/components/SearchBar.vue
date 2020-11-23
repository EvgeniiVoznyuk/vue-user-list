<template>
  <span class="p-input-icon-left">
    <i class="pi pi-search" />
    <InputText
      type="text"
      v-model="searchQuery"
      placeholder="Search"
      @change="setQuery"
    />
  </span>
</template>

<script>
import InputText from 'primevue/inputtext';

export default {
  name: 'SearchBar',
  components: {
    InputText,
  },
  data() {
    return {
      searchQuery: '',
    };
  },
  methods: {
    setQuery() {
      this.$emit('set-query', this.searchQuery);
      // console.log(this.searchQuery);
    },
  },
};
</script>
