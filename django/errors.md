## Looping over all records

This just crashes `Killed`, or worse, hangs without explanation...

    for instance in Model.objects.all():
        instance.field = update_field()
        instance.save()
        
(obviously you don't want to be changing isntance.id)

Here's one possible workaround...

    from django.db.models import Max
  
    max_id = Model.objects.all().aggregate(Max('id'))['id__max']

    for current_id in range(1, max_id + 1):  # assuming id begins at 1
        try:
            instance = Model.objects.get(id=current_id)
        except Model.DoesNotExist:
            print current_id, '(does not exist)'
        else:
            print 'Processing id', current_id
            instance.field = update_field()
            instance.save()
