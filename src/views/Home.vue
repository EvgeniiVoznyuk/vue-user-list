<template>
  <div class="container">
    <Table :users="users" />
  </div>
</template>

<script>
import Vue from 'vue';
import Table from '../components/Table.vue';

export default Vue.extend({
  name: 'Home',
  components: {
    Table,
  },
  created() {
    fetch('/api/users')
      .then((res) => res.json())
      .then((json) => {
        this.users = json.users;
      });
  },
  data() {
    return {
      users: [],
      searchQuery: '',
      columns: [
        { field: 'name', header: 'Name' },
        { field: 'userName', header: 'UserName' },
        { field: 'email', header: 'Email' },
        { field: 'role', header: 'Role(s)' },
      ],
    };
  },
});
</script>
