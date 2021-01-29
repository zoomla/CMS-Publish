<template>
	<div>
		<div class="container mt-5">
			<ul class="list-unstyled mt-5">
				aa
			<li v-for="node in nodes" :key="node.NodeID"><a href="javascript:;" @click="navTo(node)">{{node.NodeName}}</a></li>
			</ul>

			
		</div>
	</div>
</template>

<script>
	export default{
		data:function(){
			var model={nodes:[]};
			var pid=this.$route.params.id;
			window.console.log(pid);
			this.jsp("node_list",{"pid":pid}).then((ret)=>{
				model.nodes=JSON.parse(ret.result);
			})
			return model;
		},
	
		methods:{
			navTo:function(node){
				this.$router.push("/NodeContent/"+node.NodeID);
			}
		},
		metaInfo: {
			title: '节点列表',
			meta: [
				{ description: '自动逻辑的列表' },
				{ keywords: '节点,列表,栏目' },				
			]
		},			
	}
</script>

<style>
</style>
