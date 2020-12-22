import tippy from 'tippy.js';
import 'tippy.js/dist/tippy.css';

import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ "source" ];

  copy() {
    // Should replace this with
    // this.sourceTarget.select();
    // when StimulusJS documentation will be back online

    const source = document.querySelector('[data-clipboard-target="source"]');

    source.select();
    document.execCommand("copy");
    source.blur();

    const tippyOnLink = tippy(source, {
      content: source.dataset.onCopyMessage,
      trigger: 'manual',
      placement: 'bottom',
      arrow: false,
    });

    tippyOnLink.show();
  }

  share() {
    // Should replace this with
    // this.sourceTarget.select();
    // when StimulusJS documentation will be back online

    const source = document.querySelector('[data-clipboard-target="source"]');

    if (navigator.share) {
      navigator.share({
        title: source.dataset.title,
        text: source.dataset.text,
        url: source.value,
      })
        .then(() => console.log('Successful share'))
        .catch((error) => console.log('Error sharing', error));
    } else {
      this.copy();
    }
  }
}
