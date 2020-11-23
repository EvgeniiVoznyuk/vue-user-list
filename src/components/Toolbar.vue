<template>
  <Toolbar class="p-mb-4 p-mt-4 toolbar">
    <template slot="left">
      <AddUser v-on:add-user="addUser" />
    </template>
    <template slot="right">
      <SearchBar v-on:set-query="setQuery" />
    </template>
  </Toolbar>
</template>

<script>
import Toolbar from 'primevue/toolbar';
import AddUser from './AddUser.vue';
import SearchBar from './SearchBar.vue';

export default {
  name: 'Tool',
  components: {
    Toolbar,
    AddUser,
    SearchBar,
  },
  data() {
    return {
      button: null,
      displayModal: false,
    };
  },
  methods: {
    addUser(user) {
      this.$emit('add-user', user);
    },
    setQuery(query) {
      this.$emit('set-query', query);
    },
  },
};
</script>

<style scoped>
.toolbar {
  height: 60px;
  padding: 10px;
}
</style>
