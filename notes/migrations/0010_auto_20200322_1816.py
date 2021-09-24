# Generated by Django 3.0.4 on 2020-03-22 18:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('notes', '0009_auto_20200322_1454'),
    ]

    operations = [
        migrations.AlterField(
            model_name='labpost',
            name='language',
            field=models.CharField(choices=[('plaintext', 'plaintext'), ('language-c', 'C'), ('language-csharp', 'C#'), ('language-cpp', 'C++'), ('language-python', 'Python'), ('language-java', 'Java'), ('language-javascript', 'JavaScript'), ('language-kotlin', 'Kotlin'), ('language-html,', 'HTML,'), ('language-css', 'CSS'), ('language-php7', 'PHP7'), ('language-xml', 'XML'), ('language-makefile', 'Makefile'), ('language-objective-c', 'Objective-C'), ('language-sql', 'SQL'), ('language-perl', 'Perl'), ('language-shell', 'Shell'), ('language-apache', 'Apache'), ('language-bash', 'Bash'), ('language-coffeescript', 'CoffeeScript'), ('language-diff', 'Diff'), ('language-go', 'Go'), ('language-http', 'HTTP'), ('language-json', 'JSON'), ('language-lesslua', 'LessLua'), ('language-markdown', 'Markdown'), ('language-ruby', 'Ruby'), ('language-rust', 'Rust'), ('language-scss', 'SCSS'), ('language-swift', 'Swift'), ('language-ini', 'INI'), ('language-typescript', 'TypeScript'), ('language-yaml', 'YAML')], default='plaintext', max_length=30),
        ),
    ]
