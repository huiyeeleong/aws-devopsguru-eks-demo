#!/bin/sh
export AWS_PAGER=""

echo "Bootstrap initial cluster and node group"
(
  cd cluster_bootstrap && sh create_cluster.sh || exit 1
)

echo "Install kube dashboard"
(
  cd kubernetes_dashboard && sh install_dashboard.sh || exit 1
)

echo "Install ChaosMesh"
(
  cd chaos_mesh && sh install_chaos_mesh.sh || exit 1
)

# echo "Install prometheus"
# (
#   cd prometheus && sh install_prometheus.sh || exit 1
# )

# echo "Install Kong"
# (
#   cd kong && sh install_kong.sh || exit 1
# )

# echo "Add ALB controller"
# (
#   cd aws_load_balancer_controller && sh create_load_balancer_controller.sh || exit 1
# )

# echo "Create ECR repo"
# (
#   cd ecr && sh create_repo.sh || exit 1
# )

# echo "Install Redis"
# (
#   cd redis && sh install_redis.sh || exit 1
# )

# echo "Build and install test deployment"
# (
#   cd devopsguru_eks_test && sh build.sh && sh install_chart.sh || exit 1
# )

# echo "Install test client requirements"
# (
#   cd test_client && pip3 install -r requirements.txt || exit 1
# )
