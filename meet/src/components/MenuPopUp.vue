<template>
  <div class="menu">
    <font-awesome-icon id="times" icon="times" />
    <span>MEET</span>
    <p>Log out</p>
  </div>
</template>

<script>
</script>

<style scoped>
.menu {
  display: flex;
  flex-direction: column;
  justify-content: center;
  box-sizing: border-box;
  position: absolute;
  top: 0;
  left: 0;
  height: 100vh;
  width: 100vw;
  background: white;
  font-size: 1.5vh;
  font-weight: bold;
}
.menu * {
  margin: 0 auto 2vh auto;
}
#times {
  position: absolute;
  top: 0;
  right: 0;
  margin: 1vh 1vw 0 0;
}
</style>
