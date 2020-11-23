<template>
  <div class="app">
    <AppHeader />
    <div class="container">
      <Toolbar v-on:add-user="addUser" v-on:set-query="setQuery" />
      <Table :users="filtredUsers()" v-on:delete-users="deleteUsers" />
    </div>
  </div>
</template>

<script lang="">
import Vue from 'vue';
import AppHeader from '../components/AppHeader.vue';
import Toolbar from '../components/Toolbar.vue';
import Table from '../components/Table.vue';

export default Vue.extend({
  name: 'Users',
  components: {
    Table,
    AppHeader,
    Toolbar,
  },
  created() {
    fetch('/api/users')
      .then((res) => res.json())
      .then((json) => {
        this.users = json.users;
      });
    this.$emit('show-users');
  },
  data() {
    return {
      users: [],
      searchQuery: '',
    };
  },
  methods: {
    addUser(user) {
      const newUser = {
        ...user,
        role: user.role.name,
        id: this.users.length + 1,
      };
      this.users.unshift(newUser);
    },
    setQuery(query) {
      this.searchQuery = query;
    },
    filtredUsers() {
      return this.users.filter(
        ({ name, userName, email }) => name.toLowerCase().includes(this.searchQuery.toLowerCase())
          || userName.toLowerCase().includes(this.searchQuery.toLowerCase())
          || email.toLowerCase().includes(this.searchQuery.toLowerCase()),
      );
    },
    deleteUsers(usersId) {
      this.users = this.users.filter((user) => !usersId.includes(user.id));
    },
  },
});
</script>

<style scoped>
* {
  box-sizing: border-box;
  padding: 0;
  margin: 0;
}
.container {
  max-width: 1280px;
  margin: 0 auto;
}
</style>
