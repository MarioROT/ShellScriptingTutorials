init()
{
  echo "Welcome to your addressbook!"
  echo "Please choos the pick the action you require:"
  echo "   1. Search for a contact"
  echo "   2. Add new contact"
  echo "   3. Edit a contact"
  echo "   4. Remove a contact"
  echo "Select your option: "
  read userOpt

  echo "The user option $userOpt"
  case $userOpt in
    1)
         search   ;;
    2)
         add      ;;
    3)
         edit     ;;
    4)
         delete   ;;
  esac
}

search()
{
  echo "Search for a contact info"
  echo "Write a name or surname:"
  read searchName
  results=`grep -i $searchName addressbook.txt`
  echo "--> These are the found instances: "
  echo "$results" | cut -d ':' -f 1 | nl
  echo "Introduce the corresponding number according to the contact you want to see in detail: "
  read userChoice
  sContact=`echo "$results" | nl | grep "   $userChoice"`
  echo "Name [ `echo $sContact | cut -d ':' -f 1 | sed "s/ *[0-9]*.//"`  ]"
  echo "Phone [ `echo $sContact | cut -d ':' -f 2` ]"
  echo "Email [ `echo $sContact | cut -d ':' -f 3` ]"
  echo ""
  echo "(X) to exit or (M) main menu"
  read last
  if [ "$last" = "M" ]; then
    init
  fi
}

add()
{
  echo "Add a new contact"
  echo "Introduce contact's name:"
  read contactName
  echo "Introduce contact's number:"
  read contactNum
  echo "Introduce contact's email:"
  read contactEmail
  sed s/"#-#"/"$contactName:$contactNum:$contactEmail\n#-#"/g addressbook.txt > tempab.txt ; mv tempab.txt addressbook.txt
  # sed -i s/"#-#"/"$contactName:$contactNum:$contactEmail\n#-#"/g addressbook.txt
  echo "Your new contact: $contactName has been added"
  echo""
  echo "(X) to exit or (M) main menu"
  read last
  if [ "$last" = "M" ]; then
    init
  fi
}

edit()
{
  echo "Edit a contact info"
  echo "Write a name or surname:"
  read searchName
  results=`grep -i $searchName addressbook.txt`
  echo "--> These are the found instances: "
  echo "$results" | cut -d ':' -f 1 | nl
  echo "Introduce the corresponding number according to the contact you want to edit: "
  read userChoice
  contact2edit=`echo "$results" | nl | grep "   $userChoice" | sed "s/ *[0-9]*.//"`
  opts=("name" "phone" "email")
  echo "Which field of the contact you want to edit?"
  echo "1 Name"
  echo "2 Number"
  echo "3 Email"
  echo "Answer: "
  read field2Update
  echo "Introduce the new ${opts[${field2Update} - 1]}:"
  read infoUpdate
  case $field2Update in
    1)
         newContInfo="$infoUpdate:`echo $contact2edit | cut -d ":" -f 2`:`echo $contact2edit | cut -d ":" -f 3`"    ;;
    2)
         newContInfo="`echo $contact2edit | cut -d ":" -f 1`:$infoUpdate:`echo $contact2edit | cut -d ":" -f 3`"    ;;
    3)
         newContInfo="`echo $contact2edit | cut -d ":" -f 1`:`echo $contact2edit | cut -d ":" -f 2`:$infoUpdate"    ;;
    esac 
  sed s/"$contact2edit"/"$newContInfo"/g addressbook.txt > tempab.txt ; mv tempab.txt addressbook.txt
  echo "Your contact info has been updated"
  echo "Name [ `echo $newContInfo | cut -d ':' -f 1` ]"
  echo "Phone [ `echo $newContInfo | cut -d ':' -f 2` ]"
  echo "Email [ `echo $newContInfo | cut -d ':' -f 3` ]"

  echo ""
  echo "(X) to exit or (M) main menu"
  read last
  if [ "$last" = "M" ]; then
    init
  fi
}

delete()
{
  echo "Search for a contact to remove"
  echo "Write a name or surname:"
  read searchName
  results=`grep -i $searchName addressbook.txt`
  echo "--> These are the found instances: "
  echo "$results" | cut -d ':' -f 1 | nl
  echo "Introduce the corresponding number according to the contact you want to remove: "
  read userChoice
  contact2delete=`echo "$results" | nl | grep "   $userChoice" | sed "s/ *[0-9]*.//"`
  sed s/"$contact2delete"/""/g addressbook.txt > tempab.txt ; mv tempab.txt addressbook.txt
  sed "/^$/d" addressbook.txt > tempab.txt ; mv tempab.txt addressbook.txt
  echo "Your contact has been deleted"
  echo ""
  echo "(X) to exit or (M) main menu"
  read last
  if [ "$last" = "M" ]; then
    init
  fi
}

init
