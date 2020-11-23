<template>
  <div class="add-user">
    <SplitButton
      label="Add User"
      v-model="button"
      icon="pi pi-plus"
      class="p-mr-2"
      @click="toggleModal"
    >
    </SplitButton>
    <Dialog
      :showHeader="false"
      :visible="displayModal"
      :style="{ width: '40vw' }"
      :modal="true"
    >
      <div class="modal">
        <div class="modal__header p-mb-4">
          <h1 class="modal__title">New User</h1>
          <Button
            icon="pi pi-times"
            class="modal__close-button"
            @click="toggleModal"
          />
        </div>
        <div class="modal__body p-m-2">
          <form @submit.prevent="onSubmit" class="modal__form p-mb-4">
            <span class="modal__span">
              <label for="name">Name</label>
              <InputText
                class="modal__input"
                id="name"
                type="text"
                v-model="user.name"
                v-bind:class="{ 'p-invalid': user.name === '' }"
              />
              <small id="name" class="p-invalid" v-if="user.name === ''">
                Name is required
              </small>
            </span>
            <span class="modal__span">
              <label for="userName">User Name</label>
              <InputText
                class="modal__input"
                id="userName"
                type="text"
                v-model="user.userName"
                v-bind:class="{ 'p-invalid': user.userName === '' }"
              />
              <small id="name" class="p-invalid" v-if="user.userName === ''">
                Username is required.
              </small>
            </span>
            <span class="modal__span">
              <label for="email">Email</label>
              <InputText
                class="modal__input"
                id="email"
                type="text"
                v-model="user.email"
                v-bind:class="{ 'p-invalid': user.email === '' }"
              />
              <small id="name" class="p-invalid" v-if="user.email === ''">
                Username is required.
              </small>
            </span>
            <div class="modal__span">
              <label for="email">Role(s)</label>
              <Dropdown
                class="modal__input drop"
                v-model="user.role"
                :options="roles"
                optionLabel="name"
                placeholder="Admin"
              />
            </div>
            <div class="modal__buttons p-mt-4">
              <button
                class="modal__button modal__button--cancel"
                @click="toggleModal"
                type="button"
              >
                Cancel
              </button>
              <button class="modal__button modal__button--create" type="submit">
                Create User
              </button>
            </div>
          </form>
        </div>
      </div>
    </Dialog>
  </div>
</template>

<script>
import SplitButton from 'primevue/splitbutton';
import Dialog from 'primevue/dialog';
import InputText from 'primevue/inputtext';
import Dropdown from 'primevue/dropdown';

export default {
  name: 'AddUser',
  components: {
    SplitButton,
    Dialog,
    InputText,
    Dropdown,
  },
  data() {
    return {
      button: null,
      displayModal: false,
      user: {
        name: null,
        userName: null,
        email: null,
        role: 'Admin',
      },
      roles: [
        { name: 'Admin' },
        { name: 'User' },
        { name: 'Modeler' },
        { name: 'Master' },
      ],
    };
  },
  methods: {
    toggleModal() {
      this.displayModal = !this.displayModal;
    },
    onSubmit() {
      if (Object.values(this.user).includes(null)) {
        Object.entries(this.user).forEach((element) => {
          if (element[1] === null) {
            this.user[element[0]] = '';
          }
        });
      } else {
        this.$emit('add-user', this.user);
        this.user = {
          name: null,
          userName: null,
          email: null,
          role: 'Admin',
        };
        this.toggleModal();
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.modal {
  &__header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  &__input {
    width: 100%;
  }
  &__title {
    font-size: 22px;
    font-weight: bold;
    text-transform: uppercase;
    letter-spacing: -2px;
  }
  &__close-button {
    background: none;
    border: none;
    color: #000;
  }
  &__form {
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 15px;
  }
  &__span {
    display: flex;
    gap: 10px;
    flex-direction: column;
    align-items: flex-start;
  }
  &__buttons {
    display: flex;
    justify-content: space-around;
  }
  &__button {
    width: 45%;
    height: 40px;
    cursor: pointer;
    color: #fff;
    font-size: 16px;
    border: none;
    border-radius: 6px;
    transition: box-shadow 0.5s;
    &--cancel {
      background-color: #000;
    }
    &--create {
      background-color: #2490a8;
    }
    &:hover {
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    }
  }
}
</style>
