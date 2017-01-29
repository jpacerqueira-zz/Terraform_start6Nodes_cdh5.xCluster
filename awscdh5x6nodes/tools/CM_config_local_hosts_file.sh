#!/bin/bash

removeCruft() {
  rm -f /home/training/.ssh/known_hosts
  sudo rm -f /root/.ssh/known_hosts
  sudo sed -i '/nn1elephant/d' /etc/hosts
  sudo sed -i '/nn2tiger/d' /etc/hosts
  sudo sed -i '/dn1horse/d' /etc/hosts
  sudo sed -i '/dn2monkey/d' /etc/hosts
  sudo sed -i '/cm1lion/d' /etc/hosts
  sudo sed -i '/dn4snake/d' /etc/hosts
}

updateHostsFile() {
  echo ""
  echo "Please supply the EC2 public IP addresses of your five EC2 instances."
  echo ""
  invalidIP=0
  echo "What is the EC2 public IP address of your first machine (nn1 elephant)?"
  read ip1
  if [[ $ip1 == 10.* || $ip1 == 172.* || $ip1 == 192.168.* ]]; then
    invalidIP=1
  fi
  echo "What is the EC2 public IP address of your second machine (nn2 tiger)?"
  read ip2
  if [[ $ip2 == 10.* || $ip2 == 172.* || $ip2 == 192.168.* ]]; then
    invalidIP=1
  fi
  echo "What is the EC2 public IP address of your third machine (dn1 horse)?"
  read ip3
  if [[ $ip3 == 10.* || $ip3 == 172.* || $ip3 == 192.168.* ]]; then
    invalidIP=1
  fi
  echo "What is the EC2 public IP address of your fourth machine (dn2 monkey)?"
  read ip4
  if [[ $ip4 == 10.* || $ip4 == 172.* || $ip4 == 192.168.* ]]; then
    invalidIP=1
  fi
  echo "What is the EC2 public IP address of your fifth machine (cm1 lion)?"
  read ip5
  if [[ $ip5 == 10.* || $ip5 == 172.* || $ip5 == 192.168.* ]]; then
  invalidIP=1
  fi
  echo "What is the EC2 public IP address of your sixth machine (dn4 snake)?"
  read ip6
  if [[ $ip6 == 10.* || $ip5 == 172.* || $ip5 == 192.168.* ]]; then
  invalidIP=1
  fi


  echo
  echo "Please verify that these are the correct EC2 public IP addresses:"
  echo "nn1elephant:" $ip1
  echo "nn2tiger:" $ip2
  echo "dn1horse:" $ip3
  echo "dn2monkey:" $ip4
  echo "dm1lion:" $ip5
  echo "dn4snake:" $ip5

  echo
  echo "Type Y if these are the correct IP addresses, N if not."
  read answer
  if [[ $answer != "Y" && $answer != "y" ]]; then
    echo
    echo "Please restart this command and provide correct IP addresses."
    echo
    exit
  fi

  if [[ $invalidIP == "1" ]] ; then
    echo
    echo "You have entered one or more public IP addresses"
    echo "that start with 10, 172, or 192.168."
    echo "OK to Continue? Type Y if you are sure want to proceed."
    read validation
    if [[ $validation != "Y" && $validation != "y" ]]; then
      echo
      echo "Please restart this command and provide correct IP addresses."
      echo
      exit
    fi
  fi

  sudo sh -c "echo $ip1 nn1elephant >> /etc/hosts"
  sudo sh -c "echo $ip2 nn2tiger >> /etc/hosts"
  sudo sh -c "echo $ip3 dn1horse >> /etc/hosts"
  sudo sh -c "echo $ip4 dn2monkey >> /etc/hosts"
  sudo sh -c "echo $ip5 cm1lion >> /etc/hosts"
  sudo sh -c "echo $ip6 dn4snake >> /etc/hosts"

  return 0
}

MYHOST="`hostname`: "
echo 
echo $MYHOST "Running " $0"."
removeCruft
updateHostsFile
echo
echo $MYHOST $0 "done."
