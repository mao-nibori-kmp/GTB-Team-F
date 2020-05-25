<template>
    <p>{{ message }}</p>
</template>

<script>
export default {
  data: function () {
    return {
      message: "これはテストだ"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2rem;
  text-align: center;
}
</style>
