Prevent checkbox from changing by clicking, or tabbing to checkbox and pressing space.

    class MyForm(forms.ModelForm):
        class Meta:
            model = Profile
            fields = ('termsandconditions_agreed',)
            widgets = {
                'termsandconditions_agreed': forms.CheckboxInput(attrs={'onclick': 'return false'})
            }

        def clean_termsandconditions_agreed(self):
            # Prevent attempts to override the returned value
            return True
