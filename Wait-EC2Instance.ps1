Param(
  [parameter(Mandatory=$true)]
  $InstanceId
)

"wait for instances running..." | Out-Default 
do {
  Sleep 30
} while( (Get-EC2InstanceStatus -InstanceId $InstanceId).InstanceState.Name -ne 'running' )

"wait for reachability test..." | Out-Default
do {
  Sleep 45
  (Get-EC2InstanceStatus -InstanceId $InstanceId).Status | Out-Default
} while( (Get-EC2InstanceStatus -InstanceId $InstanceId).Status.Status -ne 'ok' )