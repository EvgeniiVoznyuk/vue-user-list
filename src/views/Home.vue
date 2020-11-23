<template>
  <div class="container">
    <Toolbar v-on:add-user="addUser" v-on:set-query="setQuery" />
    <Table :users="filtredUsers()" v-on:delete-users="deleteUsers" />
  </div>
</template>

<script lang="">
import Vue from 'vue';
// import Toolbar from '../components/Toolbar.vue';
// import Table from '../components/Table.vue';

export default Vue.extend({
  name: 'Users',
  components: {

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
        ({ name, userName, email }) => name.toLowerCase()
          .includes(this.searchQuery.toLowerCase()) || userName.toLowerCase()
          .includes(this.searchQuery.toLowerCase()) || email.toLowerCase()
          .includes(this.searchQuery.toLowerCase()),
      );
    },
    deleteUsers(usersId) {
      this.users = this.users.filter((user) => !usersId.includes(user.id));
    },
  },
});
</script>
