// WARNING: Contains some auto-generated boilerplate code, see:
// HHVM\UserDocumentation\MarkdownExt\ExtractedCodeBlocks\FilterBase::addBoilerplate

namespace HHVM\UserDocumentation\Guides\Hack\XHP\Interfaces\Md;

use type Facebook\XHP\HTML\div;

<<__EntryPoint>>
async function run(): Awaitable<void> {
  \init_docs_autoloader();

  $xhp =
    <div class="markdown">
      {new ExampleMarkdownXHPWrapper('Markdown goes here')}
    </div>;
  echo await $xhp->toStringAsync();
}
