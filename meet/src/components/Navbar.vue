<template>
  <div class="nav">
    <span class="logo">MEET</span>
    <font-awesome-icon icon="user-friends" style="margin-bottom: -0.1em;" />
    <font-awesome-icon icon="comments" style="margin-bottom: -0.05em;" />
    <font-awesome-icon icon="calendar" />
    <img v-on:click="toggleShowPopUp" src="../assets/avatars/female-avatar.png">
    <menu-pop-up v-if="showMenuPopUp" />
  </div>
</template>

<script>

export default {
  name: 'Navbar',
  data: function () {
    return {
      showMenuPopUp: false
    }
  },
  methods: {
    toggleShowPopUp: function () {
      this.showMenuPopUp = true
    }
  }
}
</script>

<style scoped>
.nav {
  display: flex;
  align-items: flex-end;
}
span {
  font-weight: bold;
  font-size: 6vh;
  line-height: 0.7em;
  margin-right: 3vw;
}
svg {
  font-size: 3.5vh;
  margin-right: 3vw;
}
img {
  margin-left: auto;
  height: 7vh;
}
</style>
